# Explore: explore_3248
# Auto-generated LookML Explore File

include: "/views/domain_45/view_09745.view.lkml"
include: "/views/domain_47/view_09747.view.lkml"
include: "/views/domain_48/view_09748.view.lkml"
include: "/views/domain_49/view_09749.view.lkml"

explore: explore_3248 {
  label: "Explore Explore 3248"
  description: "Comprehensive analytics explore joining base view_09745 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09745
  
  always_filter: {
    filters: [view_09745.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09745.created_at_date: "7 days"]
    unless: [view_09745.id, view_09745.status]
  }

  join: view_09747 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09745.user_id} = ${view_09747.id} ;;
    required_joins: []
  }

  join: view_09748 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09745.account_id} = ${view_09748.account_id} ;;
    required_joins: [view_09747]
  }

  join: view_09749 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09745.category} = ${view_09749.category} ;;
  }

  access_filter: {
    field: view_09745.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09745.is_deleted} = false ;;
}
