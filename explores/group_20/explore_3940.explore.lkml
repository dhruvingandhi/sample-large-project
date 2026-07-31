# Update for 2000 file diff target
# Explore: explore_3940
# Auto-generated LookML Explore File

include: "/views/domain_21/view_11821.view.lkml"
include: "/views/domain_23/view_11823.view.lkml"
include: "/views/domain_24/view_11824.view.lkml"
include: "/views/domain_25/view_11825.view.lkml"

explore: explore_3940 {
  label: "Explore Explore 3940"
  description: "Comprehensive analytics explore joining base view_11821 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11821
  
  always_filter: {
    filters: [view_11821.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11821.created_at_date: "7 days"]
    unless: [view_11821.id, view_11821.status]
  }

  join: view_11823 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11821.user_id} = ${view_11823.id} ;;
    required_joins: []
  }

  join: view_11824 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11821.account_id} = ${view_11824.account_id} ;;
    required_joins: [view_11823]
  }

  join: view_11825 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11821.category} = ${view_11825.category} ;;
  }

  access_filter: {
    field: view_11821.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11821.is_deleted} = false ;;
}
