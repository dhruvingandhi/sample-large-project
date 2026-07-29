# Explore: explore_3827
# Auto-generated LookML Explore File

include: "/views/domain_32/view_11482.view.lkml"
include: "/views/domain_34/view_11484.view.lkml"
include: "/views/domain_35/view_11485.view.lkml"
include: "/views/domain_36/view_11486.view.lkml"

explore: explore_3827 {
  label: "Explore Explore 3827"
  description: "Comprehensive analytics explore joining base view_11482 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11482
  
  always_filter: {
    filters: [view_11482.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11482.created_at_date: "7 days"]
    unless: [view_11482.id, view_11482.status]
  }

  join: view_11484 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11482.user_id} = ${view_11484.id} ;;
    required_joins: []
  }

  join: view_11485 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11482.account_id} = ${view_11485.account_id} ;;
    required_joins: [view_11484]
  }

  join: view_11486 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11482.category} = ${view_11486.category} ;;
  }

  access_filter: {
    field: view_11482.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11482.is_deleted} = false ;;
}
