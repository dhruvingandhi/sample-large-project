# Explore: explore_1073
# Auto-generated LookML Explore File

include: "/views/domain_20/view_03220.view.lkml"
include: "/views/domain_22/view_03222.view.lkml"
include: "/views/domain_23/view_03223.view.lkml"
include: "/views/domain_24/view_03224.view.lkml"

explore: explore_1073 {
  label: "Explore Explore 1073"
  description: "Comprehensive analytics explore joining base view_03220 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03220
  
  always_filter: {
    filters: [view_03220.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03220.created_at_date: "7 days"]
    unless: [view_03220.id, view_03220.status]
  }

  join: view_03222 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03220.user_id} = ${view_03222.id} ;;
    required_joins: []
  }

  join: view_03223 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03220.account_id} = ${view_03223.account_id} ;;
    required_joins: [view_03222]
  }

  join: view_03224 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03220.category} = ${view_03224.category} ;;
  }

  access_filter: {
    field: view_03220.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03220.is_deleted} = false ;;
}
