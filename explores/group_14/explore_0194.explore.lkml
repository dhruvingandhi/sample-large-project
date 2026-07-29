# Explore: explore_0194
# Auto-generated LookML Explore File

include: "/views/domain_33/view_00583.view.lkml"
include: "/views/domain_35/view_00585.view.lkml"
include: "/views/domain_36/view_00586.view.lkml"
include: "/views/domain_37/view_00587.view.lkml"

explore: explore_0194 {
  label: "Explore Explore 0194"
  description: "Comprehensive analytics explore joining base view_00583 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00583
  
  always_filter: {
    filters: [view_00583.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00583.created_at_date: "7 days"]
    unless: [view_00583.id, view_00583.status]
  }

  join: view_00585 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00583.user_id} = ${view_00585.id} ;;
    required_joins: []
  }

  join: view_00586 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00583.account_id} = ${view_00586.account_id} ;;
    required_joins: [view_00585]
  }

  join: view_00587 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00583.category} = ${view_00587.category} ;;
  }

  access_filter: {
    field: view_00583.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00583.is_deleted} = false ;;
}
