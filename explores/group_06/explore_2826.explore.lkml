# Explore: explore_2826
# Auto-generated LookML Explore File

include: "/views/domain_29/view_08479.view.lkml"
include: "/views/domain_31/view_08481.view.lkml"
include: "/views/domain_32/view_08482.view.lkml"
include: "/views/domain_33/view_08483.view.lkml"

explore: explore_2826 {
  label: "Explore Explore 2826"
  description: "Comprehensive analytics explore joining base view_08479 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08479
  
  always_filter: {
    filters: [view_08479.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08479.created_at_date: "7 days"]
    unless: [view_08479.id, view_08479.status]
  }

  join: view_08481 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08479.user_id} = ${view_08481.id} ;;
    required_joins: []
  }

  join: view_08482 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08479.account_id} = ${view_08482.account_id} ;;
    required_joins: [view_08481]
  }

  join: view_08483 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08479.category} = ${view_08483.category} ;;
  }

  access_filter: {
    field: view_08479.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08479.is_deleted} = false ;;
}
