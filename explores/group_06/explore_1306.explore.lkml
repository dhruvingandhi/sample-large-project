# Explore: explore_1306
# Auto-generated LookML Explore File

include: "/views/domain_19/view_03919.view.lkml"
include: "/views/domain_21/view_03921.view.lkml"
include: "/views/domain_22/view_03922.view.lkml"
include: "/views/domain_23/view_03923.view.lkml"

explore: explore_1306 {
  label: "Explore Explore 1306"
  description: "Comprehensive analytics explore joining base view_03919 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03919
  
  always_filter: {
    filters: [view_03919.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03919.created_at_date: "7 days"]
    unless: [view_03919.id, view_03919.status]
  }

  join: view_03921 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03919.user_id} = ${view_03921.id} ;;
    required_joins: []
  }

  join: view_03922 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03919.account_id} = ${view_03922.account_id} ;;
    required_joins: [view_03921]
  }

  join: view_03923 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03919.category} = ${view_03923.category} ;;
  }

  access_filter: {
    field: view_03919.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03919.is_deleted} = false ;;
}
