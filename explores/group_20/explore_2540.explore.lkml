# Update for 2000 file diff target
# Explore: explore_2540
# Auto-generated LookML Explore File

include: "/views/domain_21/view_07621.view.lkml"
include: "/views/domain_23/view_07623.view.lkml"
include: "/views/domain_24/view_07624.view.lkml"
include: "/views/domain_25/view_07625.view.lkml"

explore: explore_2540 {
  label: "Explore Explore 2540"
  description: "Comprehensive analytics explore joining base view_07621 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07621
  
  always_filter: {
    filters: [view_07621.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07621.created_at_date: "7 days"]
    unless: [view_07621.id, view_07621.status]
  }

  join: view_07623 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07621.user_id} = ${view_07623.id} ;;
    required_joins: []
  }

  join: view_07624 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07621.account_id} = ${view_07624.account_id} ;;
    required_joins: [view_07623]
  }

  join: view_07625 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07621.category} = ${view_07625.category} ;;
  }

  access_filter: {
    field: view_07621.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07621.is_deleted} = false ;;
}
