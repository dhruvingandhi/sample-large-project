# Explore: explore_1281
# Auto-generated LookML Explore File

include: "/views/domain_44/view_03844.view.lkml"
include: "/views/domain_46/view_03846.view.lkml"
include: "/views/domain_47/view_03847.view.lkml"
include: "/views/domain_48/view_03848.view.lkml"

explore: explore_1281 {
  label: "Explore Explore 1281"
  description: "Comprehensive analytics explore joining base view_03844 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03844
  
  always_filter: {
    filters: [view_03844.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03844.created_at_date: "7 days"]
    unless: [view_03844.id, view_03844.status]
  }

  join: view_03846 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03844.user_id} = ${view_03846.id} ;;
    required_joins: []
  }

  join: view_03847 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03844.account_id} = ${view_03847.account_id} ;;
    required_joins: [view_03846]
  }

  join: view_03848 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03844.category} = ${view_03848.category} ;;
  }

  access_filter: {
    field: view_03844.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03844.is_deleted} = false ;;
}
