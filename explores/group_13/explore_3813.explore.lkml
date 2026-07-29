# Explore: explore_3813
# Auto-generated LookML Explore File

include: "/views/domain_40/view_11440.view.lkml"
include: "/views/domain_42/view_11442.view.lkml"
include: "/views/domain_43/view_11443.view.lkml"
include: "/views/domain_44/view_11444.view.lkml"

explore: explore_3813 {
  label: "Explore Explore 3813"
  description: "Comprehensive analytics explore joining base view_11440 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11440
  
  always_filter: {
    filters: [view_11440.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11440.created_at_date: "7 days"]
    unless: [view_11440.id, view_11440.status]
  }

  join: view_11442 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11440.user_id} = ${view_11442.id} ;;
    required_joins: []
  }

  join: view_11443 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11440.account_id} = ${view_11443.account_id} ;;
    required_joins: [view_11442]
  }

  join: view_11444 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11440.category} = ${view_11444.category} ;;
  }

  access_filter: {
    field: view_11440.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11440.is_deleted} = false ;;
}
