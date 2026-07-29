# Explore: explore_3194
# Auto-generated LookML Explore File

include: "/views/domain_33/view_09583.view.lkml"
include: "/views/domain_35/view_09585.view.lkml"
include: "/views/domain_36/view_09586.view.lkml"
include: "/views/domain_37/view_09587.view.lkml"

explore: explore_3194 {
  label: "Explore Explore 3194"
  description: "Comprehensive analytics explore joining base view_09583 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09583
  
  always_filter: {
    filters: [view_09583.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09583.created_at_date: "7 days"]
    unless: [view_09583.id, view_09583.status]
  }

  join: view_09585 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09583.user_id} = ${view_09585.id} ;;
    required_joins: []
  }

  join: view_09586 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09583.account_id} = ${view_09586.account_id} ;;
    required_joins: [view_09585]
  }

  join: view_09587 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09583.category} = ${view_09587.category} ;;
  }

  access_filter: {
    field: view_09583.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09583.is_deleted} = false ;;
}
