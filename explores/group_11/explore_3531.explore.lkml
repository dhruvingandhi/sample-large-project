# Explore: explore_3531
# Auto-generated LookML Explore File

include: "/views/domain_44/view_10594.view.lkml"
include: "/views/domain_46/view_10596.view.lkml"
include: "/views/domain_47/view_10597.view.lkml"
include: "/views/domain_48/view_10598.view.lkml"

explore: explore_3531 {
  label: "Explore Explore 3531"
  description: "Comprehensive analytics explore joining base view_10594 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10594
  
  always_filter: {
    filters: [view_10594.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10594.created_at_date: "7 days"]
    unless: [view_10594.id, view_10594.status]
  }

  join: view_10596 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10594.user_id} = ${view_10596.id} ;;
    required_joins: []
  }

  join: view_10597 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10594.account_id} = ${view_10597.account_id} ;;
    required_joins: [view_10596]
  }

  join: view_10598 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10594.category} = ${view_10598.category} ;;
  }

  access_filter: {
    field: view_10594.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10594.is_deleted} = false ;;
}
