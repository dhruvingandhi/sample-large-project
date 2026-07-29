# Explore: explore_3048
# Auto-generated LookML Explore File

include: "/views/domain_45/view_09145.view.lkml"
include: "/views/domain_47/view_09147.view.lkml"
include: "/views/domain_48/view_09148.view.lkml"
include: "/views/domain_49/view_09149.view.lkml"

explore: explore_3048 {
  label: "Explore Explore 3048"
  description: "Comprehensive analytics explore joining base view_09145 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09145
  
  always_filter: {
    filters: [view_09145.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09145.created_at_date: "7 days"]
    unless: [view_09145.id, view_09145.status]
  }

  join: view_09147 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09145.user_id} = ${view_09147.id} ;;
    required_joins: []
  }

  join: view_09148 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09145.account_id} = ${view_09148.account_id} ;;
    required_joins: [view_09147]
  }

  join: view_09149 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09145.category} = ${view_09149.category} ;;
  }

  access_filter: {
    field: view_09145.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09145.is_deleted} = false ;;
}
