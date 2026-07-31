# Update for 2000 file diff target
# Explore: explore_1717
# Auto-generated LookML Explore File

include: "/views/domain_02/view_05152.view.lkml"
include: "/views/domain_04/view_05154.view.lkml"
include: "/views/domain_05/view_05155.view.lkml"
include: "/views/domain_06/view_05156.view.lkml"

explore: explore_1717 {
  label: "Explore Explore 1717"
  description: "Comprehensive analytics explore joining base view_05152 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05152
  
  always_filter: {
    filters: [view_05152.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05152.created_at_date: "7 days"]
    unless: [view_05152.id, view_05152.status]
  }

  join: view_05154 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05152.user_id} = ${view_05154.id} ;;
    required_joins: []
  }

  join: view_05155 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05152.account_id} = ${view_05155.account_id} ;;
    required_joins: [view_05154]
  }

  join: view_05156 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05152.category} = ${view_05156.category} ;;
  }

  access_filter: {
    field: view_05152.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05152.is_deleted} = false ;;
}
