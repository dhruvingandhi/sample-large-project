# Explore: explore_2381
# Auto-generated LookML Explore File

include: "/views/domain_44/view_07144.view.lkml"
include: "/views/domain_46/view_07146.view.lkml"
include: "/views/domain_47/view_07147.view.lkml"
include: "/views/domain_48/view_07148.view.lkml"

explore: explore_2381 {
  label: "Explore Explore 2381"
  description: "Comprehensive analytics explore joining base view_07144 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07144
  
  always_filter: {
    filters: [view_07144.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07144.created_at_date: "7 days"]
    unless: [view_07144.id, view_07144.status]
  }

  join: view_07146 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07144.user_id} = ${view_07146.id} ;;
    required_joins: []
  }

  join: view_07147 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07144.account_id} = ${view_07147.account_id} ;;
    required_joins: [view_07146]
  }

  join: view_07148 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07144.category} = ${view_07148.category} ;;
  }

  access_filter: {
    field: view_07144.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07144.is_deleted} = false ;;
}
