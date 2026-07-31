# Update for 2000 file diff target
# Explore: explore_3537
# Auto-generated LookML Explore File

include: "/views/domain_12/view_10612.view.lkml"
include: "/views/domain_14/view_10614.view.lkml"
include: "/views/domain_15/view_10615.view.lkml"
include: "/views/domain_16/view_10616.view.lkml"

explore: explore_3537 {
  label: "Explore Explore 3537"
  description: "Comprehensive analytics explore joining base view_10612 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10612
  
  always_filter: {
    filters: [view_10612.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10612.created_at_date: "7 days"]
    unless: [view_10612.id, view_10612.status]
  }

  join: view_10614 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10612.user_id} = ${view_10614.id} ;;
    required_joins: []
  }

  join: view_10615 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10612.account_id} = ${view_10615.account_id} ;;
    required_joins: [view_10614]
  }

  join: view_10616 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10612.category} = ${view_10616.category} ;;
  }

  access_filter: {
    field: view_10612.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10612.is_deleted} = false ;;
}
