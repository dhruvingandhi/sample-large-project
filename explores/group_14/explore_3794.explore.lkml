# Explore: explore_3794
# Auto-generated LookML Explore File

include: "/views/domain_33/view_11383.view.lkml"
include: "/views/domain_35/view_11385.view.lkml"
include: "/views/domain_36/view_11386.view.lkml"
include: "/views/domain_37/view_11387.view.lkml"

explore: explore_3794 {
  label: "Explore Explore 3794"
  description: "Comprehensive analytics explore joining base view_11383 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11383
  
  always_filter: {
    filters: [view_11383.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11383.created_at_date: "7 days"]
    unless: [view_11383.id, view_11383.status]
  }

  join: view_11385 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11383.user_id} = ${view_11385.id} ;;
    required_joins: []
  }

  join: view_11386 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11383.account_id} = ${view_11386.account_id} ;;
    required_joins: [view_11385]
  }

  join: view_11387 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11383.category} = ${view_11387.category} ;;
  }

  access_filter: {
    field: view_11383.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11383.is_deleted} = false ;;
}
