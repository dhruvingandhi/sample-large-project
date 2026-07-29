# Explore: explore_1194
# Auto-generated LookML Explore File

include: "/views/domain_33/view_03583.view.lkml"
include: "/views/domain_35/view_03585.view.lkml"
include: "/views/domain_36/view_03586.view.lkml"
include: "/views/domain_37/view_03587.view.lkml"

explore: explore_1194 {
  label: "Explore Explore 1194"
  description: "Comprehensive analytics explore joining base view_03583 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03583
  
  always_filter: {
    filters: [view_03583.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03583.created_at_date: "7 days"]
    unless: [view_03583.id, view_03583.status]
  }

  join: view_03585 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03583.user_id} = ${view_03585.id} ;;
    required_joins: []
  }

  join: view_03586 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03583.account_id} = ${view_03586.account_id} ;;
    required_joins: [view_03585]
  }

  join: view_03587 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03583.category} = ${view_03587.category} ;;
  }

  access_filter: {
    field: view_03583.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03583.is_deleted} = false ;;
}
