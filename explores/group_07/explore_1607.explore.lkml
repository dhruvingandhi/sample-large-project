# Explore: explore_1607
# Auto-generated LookML Explore File

include: "/views/domain_22/view_04822.view.lkml"
include: "/views/domain_24/view_04824.view.lkml"
include: "/views/domain_25/view_04825.view.lkml"
include: "/views/domain_26/view_04826.view.lkml"

explore: explore_1607 {
  label: "Explore Explore 1607"
  description: "Comprehensive analytics explore joining base view_04822 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04822
  
  always_filter: {
    filters: [view_04822.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04822.created_at_date: "7 days"]
    unless: [view_04822.id, view_04822.status]
  }

  join: view_04824 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04822.user_id} = ${view_04824.id} ;;
    required_joins: []
  }

  join: view_04825 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04822.account_id} = ${view_04825.account_id} ;;
    required_joins: [view_04824]
  }

  join: view_04826 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04822.category} = ${view_04826.category} ;;
  }

  access_filter: {
    field: view_04822.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04822.is_deleted} = false ;;
}
