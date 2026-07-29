# Explore: explore_1267
# Auto-generated LookML Explore File

include: "/views/domain_02/view_03802.view.lkml"
include: "/views/domain_04/view_03804.view.lkml"
include: "/views/domain_05/view_03805.view.lkml"
include: "/views/domain_06/view_03806.view.lkml"

explore: explore_1267 {
  label: "Explore Explore 1267"
  description: "Comprehensive analytics explore joining base view_03802 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03802
  
  always_filter: {
    filters: [view_03802.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03802.created_at_date: "7 days"]
    unless: [view_03802.id, view_03802.status]
  }

  join: view_03804 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03802.user_id} = ${view_03804.id} ;;
    required_joins: []
  }

  join: view_03805 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03802.account_id} = ${view_03805.account_id} ;;
    required_joins: [view_03804]
  }

  join: view_03806 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03802.category} = ${view_03806.category} ;;
  }

  access_filter: {
    field: view_03802.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03802.is_deleted} = false ;;
}
