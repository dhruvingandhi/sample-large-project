# Explore: explore_3641
# Auto-generated LookML Explore File

include: "/views/domain_24/view_10924.view.lkml"
include: "/views/domain_26/view_10926.view.lkml"
include: "/views/domain_27/view_10927.view.lkml"
include: "/views/domain_28/view_10928.view.lkml"

explore: explore_3641 {
  label: "Explore Explore 3641"
  description: "Comprehensive analytics explore joining base view_10924 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10924
  
  always_filter: {
    filters: [view_10924.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10924.created_at_date: "7 days"]
    unless: [view_10924.id, view_10924.status]
  }

  join: view_10926 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10924.user_id} = ${view_10926.id} ;;
    required_joins: []
  }

  join: view_10927 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10924.account_id} = ${view_10927.account_id} ;;
    required_joins: [view_10926]
  }

  join: view_10928 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10924.category} = ${view_10928.category} ;;
  }

  access_filter: {
    field: view_10924.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10924.is_deleted} = false ;;
}
