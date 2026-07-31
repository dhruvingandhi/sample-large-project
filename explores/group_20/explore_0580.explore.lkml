# Update for 2000 file diff target
# Explore: explore_0580
# Auto-generated LookML Explore File

include: "/views/domain_41/view_01741.view.lkml"
include: "/views/domain_43/view_01743.view.lkml"
include: "/views/domain_44/view_01744.view.lkml"
include: "/views/domain_45/view_01745.view.lkml"

explore: explore_0580 {
  label: "Explore Explore 0580"
  description: "Comprehensive analytics explore joining base view_01741 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01741
  
  always_filter: {
    filters: [view_01741.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01741.created_at_date: "7 days"]
    unless: [view_01741.id, view_01741.status]
  }

  join: view_01743 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01741.user_id} = ${view_01743.id} ;;
    required_joins: []
  }

  join: view_01744 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01741.account_id} = ${view_01744.account_id} ;;
    required_joins: [view_01743]
  }

  join: view_01745 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01741.category} = ${view_01745.category} ;;
  }

  access_filter: {
    field: view_01741.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01741.is_deleted} = false ;;
}
