# Explore: explore_2194
# Auto-generated LookML Explore File

include: "/views/domain_33/view_06583.view.lkml"
include: "/views/domain_35/view_06585.view.lkml"
include: "/views/domain_36/view_06586.view.lkml"
include: "/views/domain_37/view_06587.view.lkml"

explore: explore_2194 {
  label: "Explore Explore 2194"
  description: "Comprehensive analytics explore joining base view_06583 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06583
  
  always_filter: {
    filters: [view_06583.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06583.created_at_date: "7 days"]
    unless: [view_06583.id, view_06583.status]
  }

  join: view_06585 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06583.user_id} = ${view_06585.id} ;;
    required_joins: []
  }

  join: view_06586 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06583.account_id} = ${view_06586.account_id} ;;
    required_joins: [view_06585]
  }

  join: view_06587 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06583.category} = ${view_06587.category} ;;
  }

  access_filter: {
    field: view_06583.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06583.is_deleted} = false ;;
}
