# Explore: explore_2031
# Auto-generated LookML Explore File

include: "/views/domain_44/view_06094.view.lkml"
include: "/views/domain_46/view_06096.view.lkml"
include: "/views/domain_47/view_06097.view.lkml"
include: "/views/domain_48/view_06098.view.lkml"

explore: explore_2031 {
  label: "Explore Explore 2031"
  description: "Comprehensive analytics explore joining base view_06094 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06094
  
  always_filter: {
    filters: [view_06094.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06094.created_at_date: "7 days"]
    unless: [view_06094.id, view_06094.status]
  }

  join: view_06096 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06094.user_id} = ${view_06096.id} ;;
    required_joins: []
  }

  join: view_06097 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06094.account_id} = ${view_06097.account_id} ;;
    required_joins: [view_06096]
  }

  join: view_06098 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06094.category} = ${view_06098.category} ;;
  }

  access_filter: {
    field: view_06094.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06094.is_deleted} = false ;;
}
