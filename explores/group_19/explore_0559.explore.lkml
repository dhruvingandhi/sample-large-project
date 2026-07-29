# Explore: explore_0559
# Auto-generated LookML Explore File

include: "/views/domain_28/view_01678.view.lkml"
include: "/views/domain_30/view_01680.view.lkml"
include: "/views/domain_31/view_01681.view.lkml"
include: "/views/domain_32/view_01682.view.lkml"

explore: explore_0559 {
  label: "Explore Explore 0559"
  description: "Comprehensive analytics explore joining base view_01678 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01678
  
  always_filter: {
    filters: [view_01678.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01678.created_at_date: "7 days"]
    unless: [view_01678.id, view_01678.status]
  }

  join: view_01680 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01678.user_id} = ${view_01680.id} ;;
    required_joins: []
  }

  join: view_01681 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01678.account_id} = ${view_01681.account_id} ;;
    required_joins: [view_01680]
  }

  join: view_01682 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01678.category} = ${view_01682.category} ;;
  }

  access_filter: {
    field: view_01678.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01678.is_deleted} = false ;;
}
