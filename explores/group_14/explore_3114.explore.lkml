# Explore: explore_3114
# Auto-generated LookML Explore File

include: "/views/domain_43/view_09343.view.lkml"
include: "/views/domain_45/view_09345.view.lkml"
include: "/views/domain_46/view_09346.view.lkml"
include: "/views/domain_47/view_09347.view.lkml"

explore: explore_3114 {
  label: "Explore Explore 3114"
  description: "Comprehensive analytics explore joining base view_09343 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09343
  
  always_filter: {
    filters: [view_09343.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09343.created_at_date: "7 days"]
    unless: [view_09343.id, view_09343.status]
  }

  join: view_09345 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09343.user_id} = ${view_09345.id} ;;
    required_joins: []
  }

  join: view_09346 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09343.account_id} = ${view_09346.account_id} ;;
    required_joins: [view_09345]
  }

  join: view_09347 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09343.category} = ${view_09347.category} ;;
  }

  access_filter: {
    field: view_09343.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09343.is_deleted} = false ;;
}
