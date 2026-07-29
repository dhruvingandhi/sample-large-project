# Explore: explore_3929
# Auto-generated LookML Explore File

include: "/views/domain_38/view_11788.view.lkml"
include: "/views/domain_40/view_11790.view.lkml"
include: "/views/domain_41/view_11791.view.lkml"
include: "/views/domain_42/view_11792.view.lkml"

explore: explore_3929 {
  label: "Explore Explore 3929"
  description: "Comprehensive analytics explore joining base view_11788 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11788
  
  always_filter: {
    filters: [view_11788.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11788.created_at_date: "7 days"]
    unless: [view_11788.id, view_11788.status]
  }

  join: view_11790 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11788.user_id} = ${view_11790.id} ;;
    required_joins: []
  }

  join: view_11791 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11788.account_id} = ${view_11791.account_id} ;;
    required_joins: [view_11790]
  }

  join: view_11792 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11788.category} = ${view_11792.category} ;;
  }

  access_filter: {
    field: view_11788.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11788.is_deleted} = false ;;
}
