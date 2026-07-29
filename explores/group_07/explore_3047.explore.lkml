# Explore: explore_3047
# Auto-generated LookML Explore File

include: "/views/domain_42/view_09142.view.lkml"
include: "/views/domain_44/view_09144.view.lkml"
include: "/views/domain_45/view_09145.view.lkml"
include: "/views/domain_46/view_09146.view.lkml"

explore: explore_3047 {
  label: "Explore Explore 3047"
  description: "Comprehensive analytics explore joining base view_09142 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09142
  
  always_filter: {
    filters: [view_09142.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09142.created_at_date: "7 days"]
    unless: [view_09142.id, view_09142.status]
  }

  join: view_09144 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09142.user_id} = ${view_09144.id} ;;
    required_joins: []
  }

  join: view_09145 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09142.account_id} = ${view_09145.account_id} ;;
    required_joins: [view_09144]
  }

  join: view_09146 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09142.category} = ${view_09146.category} ;;
  }

  access_filter: {
    field: view_09142.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09142.is_deleted} = false ;;
}
