# Explore: explore_1649
# Auto-generated LookML Explore File

include: "/views/domain_48/view_04948.view.lkml"
include: "/views/domain_50/view_04950.view.lkml"
include: "/views/domain_01/view_04951.view.lkml"
include: "/views/domain_02/view_04952.view.lkml"

explore: explore_1649 {
  label: "Explore Explore 1649"
  description: "Comprehensive analytics explore joining base view_04948 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04948
  
  always_filter: {
    filters: [view_04948.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04948.created_at_date: "7 days"]
    unless: [view_04948.id, view_04948.status]
  }

  join: view_04950 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04948.user_id} = ${view_04950.id} ;;
    required_joins: []
  }

  join: view_04951 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04948.account_id} = ${view_04951.account_id} ;;
    required_joins: [view_04950]
  }

  join: view_04952 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04948.category} = ${view_04952.category} ;;
  }

  access_filter: {
    field: view_04948.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04948.is_deleted} = false ;;
}
