# Explore: explore_0967
# Auto-generated LookML Explore File

include: "/views/domain_02/view_02902.view.lkml"
include: "/views/domain_04/view_02904.view.lkml"
include: "/views/domain_05/view_02905.view.lkml"
include: "/views/domain_06/view_02906.view.lkml"

explore: explore_0967 {
  label: "Explore Explore 0967"
  description: "Comprehensive analytics explore joining base view_02902 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02902
  
  always_filter: {
    filters: [view_02902.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02902.created_at_date: "7 days"]
    unless: [view_02902.id, view_02902.status]
  }

  join: view_02904 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02902.user_id} = ${view_02904.id} ;;
    required_joins: []
  }

  join: view_02905 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02902.account_id} = ${view_02905.account_id} ;;
    required_joins: [view_02904]
  }

  join: view_02906 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02902.category} = ${view_02906.category} ;;
  }

  access_filter: {
    field: view_02902.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02902.is_deleted} = false ;;
}
