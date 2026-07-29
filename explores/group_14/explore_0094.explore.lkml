# Explore: explore_0094
# Auto-generated LookML Explore File

include: "/views/domain_33/view_00283.view.lkml"
include: "/views/domain_35/view_00285.view.lkml"
include: "/views/domain_36/view_00286.view.lkml"
include: "/views/domain_37/view_00287.view.lkml"

explore: explore_0094 {
  label: "Explore Explore 0094"
  description: "Comprehensive analytics explore joining base view_00283 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00283
  
  always_filter: {
    filters: [view_00283.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00283.created_at_date: "7 days"]
    unless: [view_00283.id, view_00283.status]
  }

  join: view_00285 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00283.user_id} = ${view_00285.id} ;;
    required_joins: []
  }

  join: view_00286 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00283.account_id} = ${view_00286.account_id} ;;
    required_joins: [view_00285]
  }

  join: view_00287 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00283.category} = ${view_00287.category} ;;
  }

  access_filter: {
    field: view_00283.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00283.is_deleted} = false ;;
}
