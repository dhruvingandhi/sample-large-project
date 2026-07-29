# Explore: explore_3857
# Auto-generated LookML Explore File

include: "/views/domain_22/view_11572.view.lkml"
include: "/views/domain_24/view_11574.view.lkml"
include: "/views/domain_25/view_11575.view.lkml"
include: "/views/domain_26/view_11576.view.lkml"

explore: explore_3857 {
  label: "Explore Explore 3857"
  description: "Comprehensive analytics explore joining base view_11572 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11572
  
  always_filter: {
    filters: [view_11572.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11572.created_at_date: "7 days"]
    unless: [view_11572.id, view_11572.status]
  }

  join: view_11574 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11572.user_id} = ${view_11574.id} ;;
    required_joins: []
  }

  join: view_11575 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11572.account_id} = ${view_11575.account_id} ;;
    required_joins: [view_11574]
  }

  join: view_11576 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11572.category} = ${view_11576.category} ;;
  }

  access_filter: {
    field: view_11572.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11572.is_deleted} = false ;;
}
