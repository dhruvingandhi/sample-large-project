# Explore: explore_3298
# Auto-generated LookML Explore File

include: "/views/domain_45/view_09895.view.lkml"
include: "/views/domain_47/view_09897.view.lkml"
include: "/views/domain_48/view_09898.view.lkml"
include: "/views/domain_49/view_09899.view.lkml"

explore: explore_3298 {
  label: "Explore Explore 3298"
  description: "Comprehensive analytics explore joining base view_09895 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09895
  
  always_filter: {
    filters: [view_09895.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09895.created_at_date: "7 days"]
    unless: [view_09895.id, view_09895.status]
  }

  join: view_09897 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09895.user_id} = ${view_09897.id} ;;
    required_joins: []
  }

  join: view_09898 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09895.account_id} = ${view_09898.account_id} ;;
    required_joins: [view_09897]
  }

  join: view_09899 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09895.category} = ${view_09899.category} ;;
  }

  access_filter: {
    field: view_09895.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09895.is_deleted} = false ;;
}
