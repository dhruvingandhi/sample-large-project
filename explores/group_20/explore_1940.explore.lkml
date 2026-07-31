# Update for 2000 file diff target
# Explore: explore_1940
# Auto-generated LookML Explore File

include: "/views/domain_21/view_05821.view.lkml"
include: "/views/domain_23/view_05823.view.lkml"
include: "/views/domain_24/view_05824.view.lkml"
include: "/views/domain_25/view_05825.view.lkml"

explore: explore_1940 {
  label: "Explore Explore 1940"
  description: "Comprehensive analytics explore joining base view_05821 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05821
  
  always_filter: {
    filters: [view_05821.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05821.created_at_date: "7 days"]
    unless: [view_05821.id, view_05821.status]
  }

  join: view_05823 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05821.user_id} = ${view_05823.id} ;;
    required_joins: []
  }

  join: view_05824 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05821.account_id} = ${view_05824.account_id} ;;
    required_joins: [view_05823]
  }

  join: view_05825 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05821.category} = ${view_05825.category} ;;
  }

  access_filter: {
    field: view_05821.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05821.is_deleted} = false ;;
}
