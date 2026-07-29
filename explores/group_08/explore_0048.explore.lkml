# Explore: explore_0048
# Auto-generated LookML Explore File

include: "/views/domain_45/view_00145.view.lkml"
include: "/views/domain_47/view_00147.view.lkml"
include: "/views/domain_48/view_00148.view.lkml"
include: "/views/domain_49/view_00149.view.lkml"

explore: explore_0048 {
  label: "Explore Explore 0048"
  description: "Comprehensive analytics explore joining base view_00145 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00145
  
  always_filter: {
    filters: [view_00145.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00145.created_at_date: "7 days"]
    unless: [view_00145.id, view_00145.status]
  }

  join: view_00147 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00145.user_id} = ${view_00147.id} ;;
    required_joins: []
  }

  join: view_00148 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00145.account_id} = ${view_00148.account_id} ;;
    required_joins: [view_00147]
  }

  join: view_00149 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00145.category} = ${view_00149.category} ;;
  }

  access_filter: {
    field: view_00145.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00145.is_deleted} = false ;;
}
