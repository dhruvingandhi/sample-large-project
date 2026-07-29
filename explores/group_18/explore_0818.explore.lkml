# Explore: explore_0818
# Auto-generated LookML Explore File

include: "/views/domain_05/view_02455.view.lkml"
include: "/views/domain_07/view_02457.view.lkml"
include: "/views/domain_08/view_02458.view.lkml"
include: "/views/domain_09/view_02459.view.lkml"

explore: explore_0818 {
  label: "Explore Explore 0818"
  description: "Comprehensive analytics explore joining base view_02455 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02455
  
  always_filter: {
    filters: [view_02455.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02455.created_at_date: "7 days"]
    unless: [view_02455.id, view_02455.status]
  }

  join: view_02457 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02455.user_id} = ${view_02457.id} ;;
    required_joins: []
  }

  join: view_02458 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02455.account_id} = ${view_02458.account_id} ;;
    required_joins: [view_02457]
  }

  join: view_02459 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02455.category} = ${view_02459.category} ;;
  }

  access_filter: {
    field: view_02455.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02455.is_deleted} = false ;;
}
