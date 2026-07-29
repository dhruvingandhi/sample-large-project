# Explore: explore_1537
# Auto-generated LookML Explore File

include: "/views/domain_12/view_04612.view.lkml"
include: "/views/domain_14/view_04614.view.lkml"
include: "/views/domain_15/view_04615.view.lkml"
include: "/views/domain_16/view_04616.view.lkml"

explore: explore_1537 {
  label: "Explore Explore 1537"
  description: "Comprehensive analytics explore joining base view_04612 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04612
  
  always_filter: {
    filters: [view_04612.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04612.created_at_date: "7 days"]
    unless: [view_04612.id, view_04612.status]
  }

  join: view_04614 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04612.user_id} = ${view_04614.id} ;;
    required_joins: []
  }

  join: view_04615 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04612.account_id} = ${view_04615.account_id} ;;
    required_joins: [view_04614]
  }

  join: view_04616 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04612.category} = ${view_04616.category} ;;
  }

  access_filter: {
    field: view_04612.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04612.is_deleted} = false ;;
}
