# Explore: explore_2659
# Auto-generated LookML Explore File

include: "/views/domain_28/view_07978.view.lkml"
include: "/views/domain_30/view_07980.view.lkml"
include: "/views/domain_31/view_07981.view.lkml"
include: "/views/domain_32/view_07982.view.lkml"

explore: explore_2659 {
  label: "Explore Explore 2659"
  description: "Comprehensive analytics explore joining base view_07978 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07978
  
  always_filter: {
    filters: [view_07978.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07978.created_at_date: "7 days"]
    unless: [view_07978.id, view_07978.status]
  }

  join: view_07980 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07978.user_id} = ${view_07980.id} ;;
    required_joins: []
  }

  join: view_07981 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07978.account_id} = ${view_07981.account_id} ;;
    required_joins: [view_07980]
  }

  join: view_07982 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07978.category} = ${view_07982.category} ;;
  }

  access_filter: {
    field: view_07978.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07978.is_deleted} = false ;;
}
