# Update for 2000 file diff target
# Explore: explore_3539
# Auto-generated LookML Explore File

include: "/views/domain_18/view_10618.view.lkml"
include: "/views/domain_20/view_10620.view.lkml"
include: "/views/domain_21/view_10621.view.lkml"
include: "/views/domain_22/view_10622.view.lkml"

explore: explore_3539 {
  label: "Explore Explore 3539"
  description: "Comprehensive analytics explore joining base view_10618 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10618
  
  always_filter: {
    filters: [view_10618.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10618.created_at_date: "7 days"]
    unless: [view_10618.id, view_10618.status]
  }

  join: view_10620 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10618.user_id} = ${view_10620.id} ;;
    required_joins: []
  }

  join: view_10621 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10618.account_id} = ${view_10621.account_id} ;;
    required_joins: [view_10620]
  }

  join: view_10622 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10618.category} = ${view_10622.category} ;;
  }

  access_filter: {
    field: view_10618.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10618.is_deleted} = false ;;
}
