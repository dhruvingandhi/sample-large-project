# Explore: explore_1031
# Auto-generated LookML Explore File

include: "/views/domain_44/view_03094.view.lkml"
include: "/views/domain_46/view_03096.view.lkml"
include: "/views/domain_47/view_03097.view.lkml"
include: "/views/domain_48/view_03098.view.lkml"

explore: explore_1031 {
  label: "Explore Explore 1031"
  description: "Comprehensive analytics explore joining base view_03094 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03094
  
  always_filter: {
    filters: [view_03094.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03094.created_at_date: "7 days"]
    unless: [view_03094.id, view_03094.status]
  }

  join: view_03096 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03094.user_id} = ${view_03096.id} ;;
    required_joins: []
  }

  join: view_03097 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03094.account_id} = ${view_03097.account_id} ;;
    required_joins: [view_03096]
  }

  join: view_03098 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03094.category} = ${view_03098.category} ;;
  }

  access_filter: {
    field: view_03094.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03094.is_deleted} = false ;;
}
