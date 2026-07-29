# Explore: explore_3871
# Auto-generated LookML Explore File

include: "/views/domain_14/view_11614.view.lkml"
include: "/views/domain_16/view_11616.view.lkml"
include: "/views/domain_17/view_11617.view.lkml"
include: "/views/domain_18/view_11618.view.lkml"

explore: explore_3871 {
  label: "Explore Explore 3871"
  description: "Comprehensive analytics explore joining base view_11614 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11614
  
  always_filter: {
    filters: [view_11614.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11614.created_at_date: "7 days"]
    unless: [view_11614.id, view_11614.status]
  }

  join: view_11616 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11614.user_id} = ${view_11616.id} ;;
    required_joins: []
  }

  join: view_11617 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11614.account_id} = ${view_11617.account_id} ;;
    required_joins: [view_11616]
  }

  join: view_11618 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11614.category} = ${view_11618.category} ;;
  }

  access_filter: {
    field: view_11614.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11614.is_deleted} = false ;;
}
