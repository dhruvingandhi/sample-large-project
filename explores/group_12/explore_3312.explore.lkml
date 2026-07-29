# Explore: explore_3312
# Auto-generated LookML Explore File

include: "/views/domain_37/view_09937.view.lkml"
include: "/views/domain_39/view_09939.view.lkml"
include: "/views/domain_40/view_09940.view.lkml"
include: "/views/domain_41/view_09941.view.lkml"

explore: explore_3312 {
  label: "Explore Explore 3312"
  description: "Comprehensive analytics explore joining base view_09937 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09937
  
  always_filter: {
    filters: [view_09937.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09937.created_at_date: "7 days"]
    unless: [view_09937.id, view_09937.status]
  }

  join: view_09939 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09937.user_id} = ${view_09939.id} ;;
    required_joins: []
  }

  join: view_09940 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09937.account_id} = ${view_09940.account_id} ;;
    required_joins: [view_09939]
  }

  join: view_09941 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09937.category} = ${view_09941.category} ;;
  }

  access_filter: {
    field: view_09937.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09937.is_deleted} = false ;;
}
