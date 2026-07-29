# Explore: explore_0764
# Auto-generated LookML Explore File

include: "/views/domain_43/view_02293.view.lkml"
include: "/views/domain_45/view_02295.view.lkml"
include: "/views/domain_46/view_02296.view.lkml"
include: "/views/domain_47/view_02297.view.lkml"

explore: explore_0764 {
  label: "Explore Explore 0764"
  description: "Comprehensive analytics explore joining base view_02293 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02293
  
  always_filter: {
    filters: [view_02293.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02293.created_at_date: "7 days"]
    unless: [view_02293.id, view_02293.status]
  }

  join: view_02295 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02293.user_id} = ${view_02295.id} ;;
    required_joins: []
  }

  join: view_02296 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02293.account_id} = ${view_02296.account_id} ;;
    required_joins: [view_02295]
  }

  join: view_02297 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02293.category} = ${view_02297.category} ;;
  }

  access_filter: {
    field: view_02293.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02293.is_deleted} = false ;;
}
