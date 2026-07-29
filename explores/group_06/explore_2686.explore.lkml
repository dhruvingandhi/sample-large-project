# Explore: explore_2686
# Auto-generated LookML Explore File

include: "/views/domain_09/view_08059.view.lkml"
include: "/views/domain_11/view_08061.view.lkml"
include: "/views/domain_12/view_08062.view.lkml"
include: "/views/domain_13/view_08063.view.lkml"

explore: explore_2686 {
  label: "Explore Explore 2686"
  description: "Comprehensive analytics explore joining base view_08059 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08059
  
  always_filter: {
    filters: [view_08059.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08059.created_at_date: "7 days"]
    unless: [view_08059.id, view_08059.status]
  }

  join: view_08061 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08059.user_id} = ${view_08061.id} ;;
    required_joins: []
  }

  join: view_08062 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08059.account_id} = ${view_08062.account_id} ;;
    required_joins: [view_08061]
  }

  join: view_08063 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08059.category} = ${view_08063.category} ;;
  }

  access_filter: {
    field: view_08059.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08059.is_deleted} = false ;;
}
