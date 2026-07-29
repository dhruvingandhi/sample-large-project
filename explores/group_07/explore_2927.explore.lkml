# Explore: explore_2927
# Auto-generated LookML Explore File

include: "/views/domain_32/view_08782.view.lkml"
include: "/views/domain_34/view_08784.view.lkml"
include: "/views/domain_35/view_08785.view.lkml"
include: "/views/domain_36/view_08786.view.lkml"

explore: explore_2927 {
  label: "Explore Explore 2927"
  description: "Comprehensive analytics explore joining base view_08782 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08782
  
  always_filter: {
    filters: [view_08782.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08782.created_at_date: "7 days"]
    unless: [view_08782.id, view_08782.status]
  }

  join: view_08784 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08782.user_id} = ${view_08784.id} ;;
    required_joins: []
  }

  join: view_08785 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08782.account_id} = ${view_08785.account_id} ;;
    required_joins: [view_08784]
  }

  join: view_08786 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08782.category} = ${view_08786.category} ;;
  }

  access_filter: {
    field: view_08782.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08782.is_deleted} = false ;;
}
