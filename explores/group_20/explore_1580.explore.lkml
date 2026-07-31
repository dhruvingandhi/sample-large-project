# Update for 2000 file diff target
# Explore: explore_1580
# Auto-generated LookML Explore File

include: "/views/domain_41/view_04741.view.lkml"
include: "/views/domain_43/view_04743.view.lkml"
include: "/views/domain_44/view_04744.view.lkml"
include: "/views/domain_45/view_04745.view.lkml"

explore: explore_1580 {
  label: "Explore Explore 1580"
  description: "Comprehensive analytics explore joining base view_04741 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04741
  
  always_filter: {
    filters: [view_04741.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04741.created_at_date: "7 days"]
    unless: [view_04741.id, view_04741.status]
  }

  join: view_04743 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04741.user_id} = ${view_04743.id} ;;
    required_joins: []
  }

  join: view_04744 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04741.account_id} = ${view_04744.account_id} ;;
    required_joins: [view_04743]
  }

  join: view_04745 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04741.category} = ${view_04745.category} ;;
  }

  access_filter: {
    field: view_04741.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04741.is_deleted} = false ;;
}
