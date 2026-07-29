# Explore: explore_3382
# Auto-generated LookML Explore File

include: "/views/domain_47/view_10147.view.lkml"
include: "/views/domain_49/view_10149.view.lkml"
include: "/views/domain_50/view_10150.view.lkml"
include: "/views/domain_01/view_10151.view.lkml"

explore: explore_3382 {
  label: "Explore Explore 3382"
  description: "Comprehensive analytics explore joining base view_10147 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10147
  
  always_filter: {
    filters: [view_10147.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10147.created_at_date: "7 days"]
    unless: [view_10147.id, view_10147.status]
  }

  join: view_10149 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10147.user_id} = ${view_10149.id} ;;
    required_joins: []
  }

  join: view_10150 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10147.account_id} = ${view_10150.account_id} ;;
    required_joins: [view_10149]
  }

  join: view_10151 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10147.category} = ${view_10151.category} ;;
  }

  access_filter: {
    field: view_10147.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10147.is_deleted} = false ;;
}
