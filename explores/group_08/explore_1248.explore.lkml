# Explore: explore_1248
# Auto-generated LookML Explore File

include: "/views/domain_45/view_03745.view.lkml"
include: "/views/domain_47/view_03747.view.lkml"
include: "/views/domain_48/view_03748.view.lkml"
include: "/views/domain_49/view_03749.view.lkml"

explore: explore_1248 {
  label: "Explore Explore 1248"
  description: "Comprehensive analytics explore joining base view_03745 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03745
  
  always_filter: {
    filters: [view_03745.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03745.created_at_date: "7 days"]
    unless: [view_03745.id, view_03745.status]
  }

  join: view_03747 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03745.user_id} = ${view_03747.id} ;;
    required_joins: []
  }

  join: view_03748 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03745.account_id} = ${view_03748.account_id} ;;
    required_joins: [view_03747]
  }

  join: view_03749 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03745.category} = ${view_03749.category} ;;
  }

  access_filter: {
    field: view_03745.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03745.is_deleted} = false ;;
}
