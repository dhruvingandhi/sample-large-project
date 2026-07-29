# Explore: explore_3462
# Auto-generated LookML Explore File

include: "/views/domain_37/view_10387.view.lkml"
include: "/views/domain_39/view_10389.view.lkml"
include: "/views/domain_40/view_10390.view.lkml"
include: "/views/domain_41/view_10391.view.lkml"

explore: explore_3462 {
  label: "Explore Explore 3462"
  description: "Comprehensive analytics explore joining base view_10387 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10387
  
  always_filter: {
    filters: [view_10387.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10387.created_at_date: "7 days"]
    unless: [view_10387.id, view_10387.status]
  }

  join: view_10389 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10387.user_id} = ${view_10389.id} ;;
    required_joins: []
  }

  join: view_10390 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10387.account_id} = ${view_10390.account_id} ;;
    required_joins: [view_10389]
  }

  join: view_10391 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10387.category} = ${view_10391.category} ;;
  }

  access_filter: {
    field: view_10387.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10387.is_deleted} = false ;;
}
