# Explore: explore_2580
# Auto-generated LookML Explore File

include: "/views/domain_41/view_07741.view.lkml"
include: "/views/domain_43/view_07743.view.lkml"
include: "/views/domain_44/view_07744.view.lkml"
include: "/views/domain_45/view_07745.view.lkml"

explore: explore_2580 {
  label: "Explore Explore 2580"
  description: "Comprehensive analytics explore joining base view_07741 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07741
  
  always_filter: {
    filters: [view_07741.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07741.created_at_date: "7 days"]
    unless: [view_07741.id, view_07741.status]
  }

  join: view_07743 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07741.user_id} = ${view_07743.id} ;;
    required_joins: []
  }

  join: view_07744 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07741.account_id} = ${view_07744.account_id} ;;
    required_joins: [view_07743]
  }

  join: view_07745 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07741.category} = ${view_07745.category} ;;
  }

  access_filter: {
    field: view_07741.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07741.is_deleted} = false ;;
}
