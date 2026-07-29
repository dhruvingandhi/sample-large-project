# Explore: explore_2813
# Auto-generated LookML Explore File

include: "/views/domain_40/view_08440.view.lkml"
include: "/views/domain_42/view_08442.view.lkml"
include: "/views/domain_43/view_08443.view.lkml"
include: "/views/domain_44/view_08444.view.lkml"

explore: explore_2813 {
  label: "Explore Explore 2813"
  description: "Comprehensive analytics explore joining base view_08440 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08440
  
  always_filter: {
    filters: [view_08440.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08440.created_at_date: "7 days"]
    unless: [view_08440.id, view_08440.status]
  }

  join: view_08442 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08440.user_id} = ${view_08442.id} ;;
    required_joins: []
  }

  join: view_08443 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08440.account_id} = ${view_08443.account_id} ;;
    required_joins: [view_08442]
  }

  join: view_08444 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08440.category} = ${view_08444.category} ;;
  }

  access_filter: {
    field: view_08440.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08440.is_deleted} = false ;;
}
