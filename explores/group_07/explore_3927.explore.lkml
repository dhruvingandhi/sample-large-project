# Explore: explore_3927
# Auto-generated LookML Explore File

include: "/views/domain_32/view_11782.view.lkml"
include: "/views/domain_34/view_11784.view.lkml"
include: "/views/domain_35/view_11785.view.lkml"
include: "/views/domain_36/view_11786.view.lkml"

explore: explore_3927 {
  label: "Explore Explore 3927"
  description: "Comprehensive analytics explore joining base view_11782 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11782
  
  always_filter: {
    filters: [view_11782.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11782.created_at_date: "7 days"]
    unless: [view_11782.id, view_11782.status]
  }

  join: view_11784 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11782.user_id} = ${view_11784.id} ;;
    required_joins: []
  }

  join: view_11785 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11782.account_id} = ${view_11785.account_id} ;;
    required_joins: [view_11784]
  }

  join: view_11786 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11782.category} = ${view_11786.category} ;;
  }

  access_filter: {
    field: view_11782.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11782.is_deleted} = false ;;
}
