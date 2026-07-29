# Explore: explore_2827
# Auto-generated LookML Explore File

include: "/views/domain_32/view_08482.view.lkml"
include: "/views/domain_34/view_08484.view.lkml"
include: "/views/domain_35/view_08485.view.lkml"
include: "/views/domain_36/view_08486.view.lkml"

explore: explore_2827 {
  label: "Explore Explore 2827"
  description: "Comprehensive analytics explore joining base view_08482 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08482
  
  always_filter: {
    filters: [view_08482.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08482.created_at_date: "7 days"]
    unless: [view_08482.id, view_08482.status]
  }

  join: view_08484 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08482.user_id} = ${view_08484.id} ;;
    required_joins: []
  }

  join: view_08485 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08482.account_id} = ${view_08485.account_id} ;;
    required_joins: [view_08484]
  }

  join: view_08486 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08482.category} = ${view_08486.category} ;;
  }

  access_filter: {
    field: view_08482.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08482.is_deleted} = false ;;
}
