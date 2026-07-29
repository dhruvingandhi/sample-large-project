# Explore: explore_3281
# Auto-generated LookML Explore File

include: "/views/domain_44/view_09844.view.lkml"
include: "/views/domain_46/view_09846.view.lkml"
include: "/views/domain_47/view_09847.view.lkml"
include: "/views/domain_48/view_09848.view.lkml"

explore: explore_3281 {
  label: "Explore Explore 3281"
  description: "Comprehensive analytics explore joining base view_09844 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09844
  
  always_filter: {
    filters: [view_09844.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09844.created_at_date: "7 days"]
    unless: [view_09844.id, view_09844.status]
  }

  join: view_09846 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09844.user_id} = ${view_09846.id} ;;
    required_joins: []
  }

  join: view_09847 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09844.account_id} = ${view_09847.account_id} ;;
    required_joins: [view_09846]
  }

  join: view_09848 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09844.category} = ${view_09848.category} ;;
  }

  access_filter: {
    field: view_09844.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09844.is_deleted} = false ;;
}
