# Explore: explore_3580
# Auto-generated LookML Explore File

include: "/views/domain_41/view_10741.view.lkml"
include: "/views/domain_43/view_10743.view.lkml"
include: "/views/domain_44/view_10744.view.lkml"
include: "/views/domain_45/view_10745.view.lkml"

explore: explore_3580 {
  label: "Explore Explore 3580"
  description: "Comprehensive analytics explore joining base view_10741 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10741
  
  always_filter: {
    filters: [view_10741.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10741.created_at_date: "7 days"]
    unless: [view_10741.id, view_10741.status]
  }

  join: view_10743 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10741.user_id} = ${view_10743.id} ;;
    required_joins: []
  }

  join: view_10744 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10741.account_id} = ${view_10744.account_id} ;;
    required_joins: [view_10743]
  }

  join: view_10745 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10741.category} = ${view_10745.category} ;;
  }

  access_filter: {
    field: view_10741.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10741.is_deleted} = false ;;
}
