# Explore: explore_3941
# Auto-generated LookML Explore File

include: "/views/domain_24/view_11824.view.lkml"
include: "/views/domain_26/view_11826.view.lkml"
include: "/views/domain_27/view_11827.view.lkml"
include: "/views/domain_28/view_11828.view.lkml"

explore: explore_3941 {
  label: "Explore Explore 3941"
  description: "Comprehensive analytics explore joining base view_11824 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11824
  
  always_filter: {
    filters: [view_11824.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11824.created_at_date: "7 days"]
    unless: [view_11824.id, view_11824.status]
  }

  join: view_11826 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11824.user_id} = ${view_11826.id} ;;
    required_joins: []
  }

  join: view_11827 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11824.account_id} = ${view_11827.account_id} ;;
    required_joins: [view_11826]
  }

  join: view_11828 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11824.category} = ${view_11828.category} ;;
  }

  access_filter: {
    field: view_11824.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11824.is_deleted} = false ;;
}
